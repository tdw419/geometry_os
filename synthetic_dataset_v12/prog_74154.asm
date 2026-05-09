; DESCRIPTION: Creates a cyan rectangular region at (153, 38) spanning 48 by 120 pixels.
; PLAN: r0=153(x), r1=38(y), r2=48(width), r3=120(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 153
LDI r1, 38
LDI r2, 48
LDI r3, 120
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
