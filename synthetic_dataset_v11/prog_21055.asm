; DESCRIPTION: Places a white 67x71 rectangle at position (157, 146).
; PLAN: r0=157(x), r1=146(y), r2=67(width), r3=71(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 157
LDI r1, 146
LDI r2, 67
LDI r3, 71
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
