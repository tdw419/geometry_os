; DESCRIPTION: Renders a red box of size 98x53 starting at (109, 16).
; PLAN: r0=109(x), r1=16(y), r2=98(width), r3=53(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 109
LDI r1, 16
LDI r2, 98
LDI r3, 53
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
