; DESCRIPTION: Places a yellow 24x109 rectangle at position (87, 126).
; PLAN: r0=87(x), r1=126(y), r2=24(width), r3=109(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 87
LDI r1, 126
LDI r2, 24
LDI r3, 109
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
