; DESCRIPTION: Renders a white box of size 90x112 starting at (413, 143).
; PLAN: r0=413(x), r1=143(y), r2=90(width), r3=112(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 413
LDI r1, 143
LDI r2, 90
LDI r3, 112
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
