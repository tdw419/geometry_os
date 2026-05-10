; DESCRIPTION: Places a yellow 39x10 rectangle at position (362, 125).
; PLAN: r0=362(x), r1=125(y), r2=39(width), r3=10(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 362
LDI r1, 125
LDI r2, 39
LDI r3, 10
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
