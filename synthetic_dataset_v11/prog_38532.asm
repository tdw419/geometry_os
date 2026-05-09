; DESCRIPTION: Composite: . Then Places a purple dot at position (10, 213). Then Places a green 67x106 rectangle at position (46, 29).
; PLAN: r0=10(x), r1=213(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r0=46(x), r1=29(y), r2=67(width), r3=106(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Places a purple dot at position (10, 213).
; PLAN: r0=10(x), r1=213(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2.
LDI r0, 10
LDI r1, 213
LDI r2, 0xAA00FF
PSET r0, r1, r2
; DESCRIPTION: Places a green 67x106 rectangle at position (46, 29).
; PLAN: r0=46(x), r1=29(y), r2=67(width), r3=106(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 46
LDI r1, 29
LDI r2, 67
LDI r3, 106
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
