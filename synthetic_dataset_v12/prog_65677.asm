; DESCRIPTION: Renders a cyan box of size 40x12 starting at (471, 177).
; PLAN: r0=471(x), r1=177(y), r2=40(width), r3=12(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 471
LDI r1, 177
LDI r2, 40
LDI r3, 12
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
