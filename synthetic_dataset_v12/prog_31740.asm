; DESCRIPTION: Places a green 106x27 rectangle at position (328, 23).
; PLAN: r0=328(x), r1=23(y), r2=106(width), r3=27(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 328
LDI r1, 23
LDI r2, 106
LDI r3, 27
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
