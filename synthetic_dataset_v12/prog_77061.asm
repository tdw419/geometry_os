; DESCRIPTION: Renders a red box of size 27x14 starting at (449, 202).
; PLAN: r0=449(x), r1=202(y), r2=27(width), r3=14(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 449
LDI r1, 202
LDI r2, 27
LDI r3, 14
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
