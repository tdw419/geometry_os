; DESCRIPTION: Renders a red box of size 21x79 starting at (205, 152).
; PLAN: r0=205(x), r1=152(y), r2=21(width), r3=79(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 205
LDI r1, 152
LDI r2, 21
LDI r3, 79
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
