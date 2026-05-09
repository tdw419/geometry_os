; DESCRIPTION: Renders a red box of size 25x115 starting at (171, 16).
; PLAN: r0=171(x), r1=16(y), r2=25(width), r3=115(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 171
LDI r1, 16
LDI r2, 25
LDI r3, 115
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
