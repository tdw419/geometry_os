; DESCRIPTION: Renders a red box of size 22x112 starting at (487, 134).
; PLAN: r0=487(x), r1=134(y), r2=22(width), r3=112(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 487
LDI r1, 134
LDI r2, 22
LDI r3, 112
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
