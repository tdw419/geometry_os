; DESCRIPTION: Creates a black rectangular region at (317, 214) spanning 56 by 30 pixels.
; PLAN: r0=317(x), r1=214(y), r2=56(width), r3=30(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 317
LDI r1, 214
LDI r2, 56
LDI r3, 30
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
