; DESCRIPTION: Places a red 57x49 rectangle at position (336, 146).
; PLAN: r0=336(x), r1=146(y), r2=57(width), r3=49(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 336
LDI r1, 146
LDI r2, 57
LDI r3, 49
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
