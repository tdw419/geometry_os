; DESCRIPTION: Places a green 54x86 rectangle at position (51, 54).
; PLAN: r0=51(x), r1=54(y), r2=54(width), r3=86(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 51
LDI r1, 54
LDI r2, 54
LDI r3, 86
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
