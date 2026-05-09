; DESCRIPTION: Places a yellow 113x86 rectangle at position (46, 61).
; PLAN: r0=46(x), r1=61(y), r2=113(width), r3=86(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 46
LDI r1, 61
LDI r2, 113
LDI r3, 86
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
