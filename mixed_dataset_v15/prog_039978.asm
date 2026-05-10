; DESCRIPTION: Places a green 46x52 rectangle at position (217, 154).
; PLAN: r0=217(x), r1=154(y), r2=46(width), r3=52(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 217
LDI r1, 154
LDI r2, 46
LDI r3, 52
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
