; DESCRIPTION: Places a green 51x17 box at position (150, 154).
; PLAN: r0=150(x), r1=154(y), r2=51(width), r3=17(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 150
LDI r1, 154
LDI r2, 51
LDI r3, 17
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
