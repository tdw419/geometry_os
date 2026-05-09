; DESCRIPTION: Places a red 68x43 rectangle at position (417, 213).
; PLAN: r0=417(x), r1=213(y), r2=68(width), r3=43(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 417
LDI r1, 213
LDI r2, 68
LDI r3, 43
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
