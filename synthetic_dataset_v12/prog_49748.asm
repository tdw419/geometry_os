; DESCRIPTION: Renders a cyan box of size 111x66 starting at (400, 115).
; PLAN: r0=400(x), r1=115(y), r2=111(width), r3=66(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 400
LDI r1, 115
LDI r2, 111
LDI r3, 66
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
