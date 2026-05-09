; DESCRIPTION: Places a yellow 42x52 rectangle at position (260, 7).
; PLAN: r0=260(x), r1=7(y), r2=42(width), r3=52(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 260
LDI r1, 7
LDI r2, 42
LDI r3, 52
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
