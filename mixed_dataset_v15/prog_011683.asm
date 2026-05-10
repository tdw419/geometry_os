; DESCRIPTION: Renders a red box of size 87x91 starting at (305, 145).
; PLAN: r0=305(x), r1=145(y), r2=87(width), r3=91(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 305
LDI r1, 145
LDI r2, 87
LDI r3, 91
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
