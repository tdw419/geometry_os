; DESCRIPTION: Renders a white box of size 31x27 starting at (267, 226).
; PLAN: r0=267(x), r1=226(y), r2=31(width), r3=27(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 267
LDI r1, 226
LDI r2, 31
LDI r3, 27
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
