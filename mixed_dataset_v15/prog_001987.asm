; DESCRIPTION: Renders a white box of size 96x102 starting at (398, 21).
; PLAN: r0=398(x), r1=21(y), r2=96(width), r3=102(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 398
LDI r1, 21
LDI r2, 96
LDI r3, 102
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
