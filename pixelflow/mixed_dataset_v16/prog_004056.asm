; DESCRIPTION: Renders a red box of size 120x12 starting at (8, 152).
; PLAN: r0=8(x), r1=152(y), r2=120(width), r3=12(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 8
LDI r1, 152
LDI r2, 120
LDI r3, 12
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
