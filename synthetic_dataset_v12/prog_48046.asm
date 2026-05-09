; DESCRIPTION: Places a red 61x80 rectangle at position (304, 143).
; PLAN: r0=304(x), r1=143(y), r2=61(width), r3=80(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 304
LDI r1, 143
LDI r2, 61
LDI r3, 80
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
