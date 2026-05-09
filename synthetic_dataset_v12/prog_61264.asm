; DESCRIPTION: Places a blue 10x113 rectangle at position (465, 83).
; PLAN: r0=465(x), r1=83(y), r2=10(width), r3=113(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 465
LDI r1, 83
LDI r2, 10
LDI r3, 113
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
