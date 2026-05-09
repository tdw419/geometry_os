; DESCRIPTION: Places a yellow 52x16 rectangle at position (187, 150).
; PLAN: r0=187(x), r1=150(y), r2=52(width), r3=16(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 187
LDI r1, 150
LDI r2, 52
LDI r3, 16
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
