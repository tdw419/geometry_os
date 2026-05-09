; DESCRIPTION: Composite: . Then Places a yellow 21x72 rectangle at position (107, 117). Then Sets a single black pixel at (236, 232).
; PLAN: r0=107(x), r1=117(y), r2=21(width), r3=72(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=236(x), r1=232(y), r2=0x000000(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Places a yellow 21x72 rectangle at position (107, 117).
; PLAN: r0=107(x), r1=117(y), r2=21(width), r3=72(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 107
LDI r1, 117
LDI r2, 21
LDI r3, 72
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Sets a single black pixel at (236, 232).
; PLAN: r0=236(x), r1=232(y), r2=0x000000(color). Op: PSET r0, r1, r2.
LDI r0, 236
LDI r1, 232
LDI r2, 0x000000
PSET r0, r1, r2
HALT
