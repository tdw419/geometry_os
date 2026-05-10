; DESCRIPTION: Places a green 113x102 rectangle at position (154, 103).
; PLAN: r0=154(x), r1=103(y), r2=113(width), r3=102(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 154
LDI r1, 103
LDI r2, 113
LDI r3, 102
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
