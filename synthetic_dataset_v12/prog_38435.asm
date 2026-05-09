; DESCRIPTION: Places a green 24x47 rectangle at position (307, 165).
; PLAN: r0=307(x), r1=165(y), r2=24(width), r3=47(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 307
LDI r1, 165
LDI r2, 24
LDI r3, 47
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
