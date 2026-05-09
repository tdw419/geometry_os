; DESCRIPTION: Renders a red box of size 113x16 starting at (116, 208).
; PLAN: r0=116(x), r1=208(y), r2=113(width), r3=16(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 116
LDI r1, 208
LDI r2, 113
LDI r3, 16
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
