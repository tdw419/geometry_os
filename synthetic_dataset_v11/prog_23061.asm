; DESCRIPTION: Places a green 27x51 rectangle at position (229, 39).
; PLAN: r0=229(x), r1=39(y), r2=27(width), r3=51(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 229
LDI r1, 39
LDI r2, 27
LDI r3, 51
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
