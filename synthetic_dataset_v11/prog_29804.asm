; DESCRIPTION: Places a green 82x103 rectangle at position (101, 146).
; PLAN: r0=101(x), r1=146(y), r2=82(width), r3=103(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 101
LDI r1, 146
LDI r2, 82
LDI r3, 103
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
