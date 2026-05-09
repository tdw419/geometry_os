; DESCRIPTION: Renders a black box of size 94x44 starting at (42, 177).
; PLAN: r0=42(x), r1=177(y), r2=94(width), r3=44(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 42
LDI r1, 177
LDI r2, 94
LDI r3, 44
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
