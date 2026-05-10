; DESCRIPTION: Places a cyan 61x91 rectangle at position (25, 95).
; PLAN: r0=25(x), r1=95(y), r2=61(width), r3=91(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 25
LDI r1, 95
LDI r2, 61
LDI r3, 91
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
