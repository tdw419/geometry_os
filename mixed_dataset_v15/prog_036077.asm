; DESCRIPTION: Places a orange 114x18 box at position (284, 29).
; PLAN: r0=284(x), r1=29(y), r2=114(width), r3=18(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 284
LDI r1, 29
LDI r2, 114
LDI r3, 18
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
