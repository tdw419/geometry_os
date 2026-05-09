; DESCRIPTION: Renders a white box of size 112x28 starting at (392, 177).
; PLAN: r0=392(x), r1=177(y), r2=112(width), r3=28(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 392
LDI r1, 177
LDI r2, 112
LDI r3, 28
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
