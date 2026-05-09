; DESCRIPTION: Renders a red box of size 71x86 starting at (277, 7).
; PLAN: r0=277(x), r1=7(y), r2=71(width), r3=86(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 277
LDI r1, 7
LDI r2, 71
LDI r3, 86
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
