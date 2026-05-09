; DESCRIPTION: Renders a red box of size 57x81 starting at (393, 171).
; PLAN: r0=393(x), r1=171(y), r2=57(width), r3=81(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 393
LDI r1, 171
LDI r2, 57
LDI r3, 81
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
