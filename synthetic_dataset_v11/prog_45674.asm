; DESCRIPTION: Creates a black rectangular region at (180, 44) spanning 48 by 92 pixels.
; PLAN: r0=180(x), r1=44(y), r2=48(width), r3=92(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 180
LDI r1, 44
LDI r2, 48
LDI r3, 92
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
