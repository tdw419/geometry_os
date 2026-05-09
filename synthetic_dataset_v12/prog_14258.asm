; DESCRIPTION: Renders a red box of size 106x95 starting at (297, 146).
; PLAN: r0=297(x), r1=146(y), r2=106(width), r3=95(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 297
LDI r1, 146
LDI r2, 106
LDI r3, 95
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
