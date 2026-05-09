; DESCRIPTION: Places a yellow 103x13 rectangle at position (399, 154).
; PLAN: r0=399(x), r1=154(y), r2=103(width), r3=13(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 399
LDI r1, 154
LDI r2, 103
LDI r3, 13
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
