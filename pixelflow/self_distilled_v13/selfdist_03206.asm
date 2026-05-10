; DESCRIPTION: Places a white 43x80 box at position (362, 198).
; PLAN: r0=362(x), r1=198(y), r2=43(width), r3=80(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 362
LDI r1, 198
LDI r2, 43
LDI r3, 80
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
