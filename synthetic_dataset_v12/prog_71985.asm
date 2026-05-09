; DESCRIPTION: Renders a red box of size 103x22 starting at (124, 150).
; PLAN: r0=124(x), r1=150(y), r2=103(width), r3=22(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 124
LDI r1, 150
LDI r2, 103
LDI r3, 22
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
