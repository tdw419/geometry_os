; DESCRIPTION: Renders a red box of size 57x109 starting at (86, 47).
; PLAN: r0=86(x), r1=47(y), r2=57(width), r3=109(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 86
LDI r1, 47
LDI r2, 57
LDI r3, 109
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
