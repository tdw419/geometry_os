; DESCRIPTION: Places a green 16x103 rectangle at position (66, 146).
; PLAN: r0=66(x), r1=146(y), r2=16(width), r3=103(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 66
LDI r1, 146
LDI r2, 16
LDI r3, 103
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
