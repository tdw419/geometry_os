; DESCRIPTION: Places a red 59x111 box at position (362, 196).
; PLAN: r0=362(x), r1=196(y), r2=59(width), r3=111(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 362
LDI r1, 196
LDI r2, 59
LDI r3, 111
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
