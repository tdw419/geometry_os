; DESCRIPTION: Renders a red box of size 106x67 starting at (103, 177).
; PLAN: r0=103(x), r1=177(y), r2=106(width), r3=67(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 103
LDI r1, 177
LDI r2, 106
LDI r3, 67
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
