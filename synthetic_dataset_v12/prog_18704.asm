; DESCRIPTION: Renders a red box of size 116x44 starting at (274, 154).
; PLAN: r0=274(x), r1=154(y), r2=116(width), r3=44(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 274
LDI r1, 154
LDI r2, 116
LDI r3, 44
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
