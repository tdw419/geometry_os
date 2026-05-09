; DESCRIPTION: Places a yellow 63x43 rectangle at position (146, 117).
; PLAN: r0=146(x), r1=117(y), r2=63(width), r3=43(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 146
LDI r1, 117
LDI r2, 63
LDI r3, 43
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
