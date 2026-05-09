; DESCRIPTION: Renders a red box of size 117x109 starting at (263, 27).
; PLAN: r0=263(x), r1=27(y), r2=117(width), r3=109(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 263
LDI r1, 27
LDI r2, 117
LDI r3, 109
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
