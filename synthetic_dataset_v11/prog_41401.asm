; DESCRIPTION: Places a cyan 67x61 rectangle at position (168, 171).
; PLAN: r0=168(x), r1=171(y), r2=67(width), r3=61(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 168
LDI r1, 171
LDI r2, 67
LDI r3, 61
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
