; DESCRIPTION: Places a red 113x47 rectangle at position (61, 86).
; PLAN: r0=61(x), r1=86(y), r2=113(width), r3=47(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 61
LDI r1, 86
LDI r2, 113
LDI r3, 47
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
