; 021_spiral.asm -- Archimedean spiral from center using LINE instructions

; Dark background
LDI r0, 0
LDI r1, 0
LDI r2, 256
LDI r3, 256
LDI r4, 0x111122
RECTF r0, r1, r2, r3, r4

; Segment 0: (130,128) -> (131,126)
LDI r0, 130
LDI r1, 128
LDI r2, 131
LDI r3, 126
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4

; Segment 1: (131,126) -> (131,124)
LDI r0, 131
LDI r1, 126
LDI r2, 131
LDI r3, 124
LDI r4, 0xFF4400
LINE r0, r1, r2, r3, r4

; Segment 2: (131,124) -> (128,121)
LDI r0, 131
LDI r1, 124
LDI r2, 128
LDI r3, 121
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4

; Segment 3: (128,121) -> (124,121)
LDI r0, 128
LDI r1, 121
LDI r2, 124
LDI r3, 121
LDI r4, 0xFFBB00
LINE r0, r1, r2, r3, r4

; Segment 4: (124,121) -> (119,123)
LDI r0, 124
LDI r1, 121
LDI r2, 119
LDI r3, 123
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4

; Segment 5: (119,123) -> (117,128)
LDI r0, 119
LDI r1, 123
LDI r2, 117
LDI r3, 128
LDI r4, 0x88FF00
LINE r0, r1, r2, r3, r4

; Segment 6: (117,128) -> (117,134)
LDI r0, 117
LDI r1, 128
LDI r2, 117
LDI r3, 134
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4

; Segment 7: (117,134) -> (121,141)
LDI r0, 117
LDI r1, 134
LDI r2, 121
LDI r3, 141
LDI r4, 0x00FF88
LINE r0, r1, r2, r3, r4

; Segment 8: (121,141) -> (128,144)
LDI r0, 121
LDI r1, 141
LDI r2, 128
LDI r3, 144
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4

; Segment 9: (128,144) -> (137,143)
LDI r0, 128
LDI r1, 144
LDI r2, 137
LDI r3, 143
LDI r4, 0x0088FF
LINE r0, r1, r2, r3, r4

; Segment 10: (137,143) -> (145,138)
LDI r0, 137
LDI r1, 143
LDI r2, 145
LDI r3, 138
LDI r4, 0x0044FF
LINE r0, r1, r2, r3, r4

; Segment 11: (145,138) -> (149,128)
LDI r0, 145
LDI r1, 138
LDI r2, 149
LDI r3, 128
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4

; Segment 12: (149,128) -> (147,117)
LDI r0, 149
LDI r1, 128
LDI r2, 147
LDI r3, 117
LDI r4, 0x4400FF
LINE r0, r1, r2, r3, r4

; Segment 13: (147,117) -> (140,107)
LDI r0, 147
LDI r1, 117
LDI r2, 140
LDI r3, 107
LDI r4, 0x8800FF
LINE r0, r1, r2, r3, r4

; Segment 14: (140,107) -> (128,102)
LDI r0, 140
LDI r1, 107
LDI r2, 128
LDI r3, 102
LDI r4, 0xBB00FF
LINE r0, r1, r2, r3, r4

; Segment 15: (128,102) -> (114,105)
LDI r0, 128
LDI r1, 102
LDI r2, 114
LDI r3, 105
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4

; Segment 16: (114,105) -> (103,114)
LDI r0, 114
LDI r1, 105
LDI r2, 103
LDI r3, 114
LDI r4, 0xFF00BB
LINE r0, r1, r2, r3, r4

; Segment 17: (103,114) -> (98,128)
LDI r0, 103
LDI r1, 114
LDI r2, 98
LDI r3, 128
LDI r4, 0xFF0088
LINE r0, r1, r2, r3, r4

; Segment 18: (98,128) -> (100,144)
LDI r0, 98
LDI r1, 128
LDI r2, 100
LDI r3, 144
LDI r4, 0xFF0044
LINE r0, r1, r2, r3, r4

; Segment 19: (100,144) -> (111,157)
LDI r0, 100
LDI r1, 144
LDI r2, 111
LDI r3, 157
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4

; Segment 20: (111,157) -> (128,163)
LDI r0, 111
LDI r1, 157
LDI r2, 128
LDI r3, 163
LDI r4, 0xFF4400
LINE r0, r1, r2, r3, r4

; Segment 21: (128,163) -> (146,160)
LDI r0, 128
LDI r1, 163
LDI r2, 146
LDI r3, 160
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4

; Segment 22: (146,160) -> (161,147)
LDI r0, 146
LDI r1, 160
LDI r2, 161
LDI r3, 147
LDI r4, 0xFFBB00
LINE r0, r1, r2, r3, r4

; Segment 23: (161,147) -> (168,128)
LDI r0, 161
LDI r1, 147
LDI r2, 168
LDI r3, 128
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4

HALT
