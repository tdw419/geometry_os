; DESCRIPTION: Places a red 24x50 rectangle at position (63, 57).
; PLAN: r0=63(x), r1=57(y), r2=24(width), r3=50(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 63
LDI r1, 57
LDI r2, 24
LDI r3, 50
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
