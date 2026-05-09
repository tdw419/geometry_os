; DESCRIPTION: Places a cyan 46x112 rectangle at position (455, 103).
; PLAN: r0=455(x), r1=103(y), r2=46(width), r3=112(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 455
LDI r1, 103
LDI r2, 46
LDI r3, 112
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
